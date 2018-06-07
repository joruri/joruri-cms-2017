ZomekiCMS::Application.routes.draw do
  mod = 'ad_banner'

  ## admin
  scope "#{ZomekiCMS::ADMIN_URL_PREFIX}/#{mod}/c:concept", :module => mod, :as => mod do
    resources :content_base,
      :controller => 'admin/content/base'

    resources :content_settings, :only => [:index, :show, :edit, :update],
      :controller => 'admin/content/settings',
      :path       => ':content/content_settings'

    ## contents
    resources(:banners,
      :controller => 'admin/banners',
      :path       => ':content/banners') do
      member do
        get :file_content
      end
      resources :clicks, :only => :index,
        :controller => 'admin/clicks'
    end
    resources :groups,
      :controller => 'admin/groups',
      :path       => ':content/groups'

    ## nodes
    resources :node_banners,
      :controller => 'admin/node/banners',
      :path       => ':parent/node_banners'

    ## pieces
    resources :piece_banners,
      :controller => 'admin/piece/banners'
  end

  ## public
  scope "_public/#{mod}", :module => mod, :as => '' do
    get 'node_banners(/index.:format)' => 'public/node/banners#index'
    get 'node_banners/:file_base.:file_ext' => 'public/node/banners#index'
    get 'node_banners/:token' => 'public/node/banners#index'
  end

  ## api
  scope "_api/#{mod}", :module => mod, :as => '' do
    get 'piece_banners' => 'public/api/piece/banners#index'
    get 'piece_clicks' => 'public/api/piece/clicks#index'
  end
end
