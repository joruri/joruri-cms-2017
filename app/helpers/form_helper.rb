module FormHelper
  ## CKEditor
  def init_ckeditor(options = {})
    settings = []

    # リードオンリーではツールバーを表示しない・リンクを動作させる
    if options[:readOnly]
      options[:toolbarCanCollapse] = true
      options[:toolbarStartupExpanded] = false
      settings.push(<<-EOS)
        CKEDITOR.on('instanceReady', function (e) {
          $('#'+e.editor.id+'_top').hide();
          $('div.cke_wordcount').hide();
          var links = $('#'+e.editor.id+'_contents > iframe:first').contents().find('a');
          for (var i = 0; i < links.length; i++) {
            $(links[i]).click(function (ee) { location.href = ee.target.href; });
          }
        });
      EOS
    end

    settings.concat(options.map {|k, v|
      %Q(CKEDITOR.config.#{k} = #{v.kind_of?(String) ? "'#{v}'" : v};)
    })

    ['<script src="/_common/js/ckeditor/ckeditor.js"></script>',
     javascript_tag(settings.join)].join.html_safe
  end

  def submission_label(name)
    {
      add:      '追加する',
      create:   '作成する',
      register: '登録する',
      edit:     '編集する',
      update:   '更新する',
      change:   '変更する',
      delete:   '削除する',
      make:     '作成する'
    }[name]
  end

  def submit(*args)
    make_tag = Proc.new do |_name, _label|
      _label ||= submission_label(_name) || _name.to_s.humanize
      submit_tag _label, name: "commit_#{_name}"
    end
    
    h = '<div class="submitters">'
    if args[0].class == String || args[0].class == Symbol
      h += make_tag.call(args[0], args[1])
    elsif args[0].class == Hash
      args[0].each {|k, v| h += make_tag.call(k, v) }
    elsif args[0].class == Array
      args[0].each {|v, k| h += make_tag.call(k, v) }
    end
    h += '</div>'
    h.html_safe
  end
end
