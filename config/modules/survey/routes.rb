ZomekiCMS::Application.routes.draw do
  mod = 'survey'

  ## admin
  scope "#{ZomekiCMS::ADMIN_URL_PREFIX}/#{mod}/c:concept", :module => mod, :as => mod do
    resources :content_base,
      :controller => 'admin/content/base'

    resources :content_settings, :only => [:index, :show, :edit, :update],
      :controller => 'admin/content/settings',
      :path       => ':content/content_settings'

    ## contents
    resources(:forms,
      :controller => 'admin/forms',
      :path       => ':content/forms') do
      member do
        post :approve
        post :publish
        post :close
      end
      resources :questions,
        :controller => 'admin/questions'
      resources :form_answers, :only => [:index, :show, :destroy],
        :controller => 'admin/form_answers'
      resources :aggregations, :only => [:index],
        :controller => 'admin/aggregations'
    end

    ## nodes
    resources :node_forms,
      :controller => 'admin/node/forms',
      :path       => ':parent/node_forms'

    ## pieces
    resources :piece_forms,
      :controller => 'admin/piece/forms'
  end

  ## public
  scope "_public/#{mod}", :module => mod, :as => '' do
    get 'node_forms(/index)' => 'public/node/forms#index'      # for end with slash
    get 'node_forms/:id(/index)' => 'public/node/forms#show'   # for end with slash
    resources(:node_forms, :only => [:index, :show],
      :controller => 'public/node/forms') do
      member do
        post :confirm_answers
        post :send_answers
        get :finish
      end
    end
  end
end
