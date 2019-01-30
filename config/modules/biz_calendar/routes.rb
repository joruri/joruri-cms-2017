ZomekiCMS::Application.routes.draw do
  mod = "biz_calendar"
  
  ## admin
  scope "#{ZomekiCMS::ADMIN_URL_PREFIX}/#{mod}/c:concept", :module => mod, :as => mod do
    resources(:places,
      :controller  => "admin/places",
      :path        => ":content/places") do
      resources :bussiness_hours,
        :controller => 'admin/bussiness_hours'
      resources :bussiness_holidays,
        :controller => 'admin/bussiness_holidays'
      resources :exception_holidays,
        :controller => 'admin/exception_holidays'
    end
    resources :holiday_types,
      :controller  => "admin/holiday_types",
      :path        => ":content/holiday_types"
    
    ## content
    resources :content_base,
      :controller => "admin/content/base"
    resources :content_settings,
      :controller  => "admin/content/settings",
      :path        => ":content/content_settings"
    
    ## node
    resources :node_places,
      :controller  => "admin/node/places",
      :path        => ":parent/node_places"
    
    ## piece
    resources :piece_calendars,
      :controller  => "admin/piece/calendars"
    resources :piece_bussiness_holidays,
      :controller  => "admin/piece/bussiness_holidays"
    resources :piece_bussiness_times,
      :controller  => "admin/piece/bussiness_times"
  end
  
  ## public
  scope "_public/#{mod}", :module => mod, :as => "" do
    match "node_places/index"              => "public/node/places#index",
      :as => nil, :via => [:get, :post]
    match "node_places/:piece/bussiness_times/:name" => "public/node/places#bussiness_times", :via => [:get, :post]
    match "node_places/:piece/bussiness_times"       => "public/node/places#bussiness_times", :via => [:get, :post]
    match "node_places/:piece/bussiness_holidays/:name" => "public/node/places#bussiness_holidays", :via => [:get, :post]
    match "node_places/:piece/bussiness_holidays"       => "public/node/places#bussiness_holidays", :via => [:get, :post]
    match "node_places/:name/index"        => "public/node/places#show",
      :as => nil, :via => [:get, :post]
  end
end
