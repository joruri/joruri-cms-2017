require 'nkf'
require 'csv'
class Sys::Admin::Groups::ExportController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base
  
  def pre_dispatch
    return error_auth unless Core.user.has_auth?(:manager)
  end
  
  def index
    
  end
 
  def export
    if params[:do] == 'groups'
      export_groups
    elsif params[:do] == 'users'
      export_users
    else
      return redirect_to(:action => :index)
    end
  end

  def site_groups
    Sys::Group.roots.in_site(Core.site).flat_map { |g| g.descendants_in_site(Core.site) }
  end

  def export_groups
    csv = CSV.generate do |csv|
      csv << [:code, :parent_code, :state, :level_no, :sort_no,:ldap,
        :ldap_version, :name, :name_en, :address, :tel, :tel_attend, :fax,
        :email, :note]
      site_groups.each do |group|
        row = []
        row << group.code
        row << group.parent.try!(:code)
        row << group.state
        row << group.level_no
        row << group.sort_no
        row << group.ldap
        row << group.ldap_version
        row << group.name
        row << group.name_en
        row << group.address
        row << group.tel
        row << group.tel_attend
        row << group.fax
        row << group.email
        row << group.note
        csv << row
      end
    end
    csv = NKF.nkf('-Ws -Lw', csv)
    send_data(csv, :type => 'text/csv; charset=Shift_JIS', :filename => "sys_groups_#{Time.now.to_i}.csv")
  end

  def site_users
    Sys::User.in_site(Core.site).where.not(id: Sys::User::ROOT_ID).order(:id)
  end

  def export_users
    csv = CSV.generate do |csv|

      csv << if Core.user.root?
        [:account, :state, :name, :name_en, :email, :auth_no, :password, :ldap, :ldap_version,
        :group_code, :admin_creatable]
      else
        [:account, :state, :name, :name_en, :email, :auth_no, :password, :ldap, :ldap_version,
        :group_code]
      end

      site_users.each do |user|
        next unless user.groups[0]
        row = []
        row << user.account
        row << user.state
        row << user.name
        row << user.name_en
        row << user.email
        row << user.auth_no
        row << user.password
        row << user.ldap
        row << user.ldap_version
        row << user.groups[0].code
        row << user.admin_creatable if Core.user.root?
        csv << row
      end
    end
    csv = NKF.nkf('-Ws -Lw', csv)
    send_data(csv, :type => 'text/csv; charset=Shift_JIS', :filename => "sys_users_#{Time.now.to_i}.csv")
  end
end
