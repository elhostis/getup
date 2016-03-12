Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'sessions'}

  scope 'admin', :module => 'back', :as => 'back' do
    root to: "activites#index"

    resources :activites do
      member do
        get  'publish_status/:publish', :action => 'publish_status', :as => 'publish_status'
        get  'previsu', :action => 'previsu', :as => 'previsu'
      end
    end
    post 'activites/update/all', to: 'activites#update_all', :as => 'activite_update_all'

    resources :sousactivites do
      member do
        get  'publish_status/:publish', :action => 'publish_status', :as => 'publish_status'
        get  'previsu', :action => 'previsu', :as => 'previsu'
      end

      post 'sousactivite_images/update_row_order', to: 'sousactivite_images#update_row_order', as: 'update_row_order', on: :collection
      resources :sousactivite_images
    end

    resources :news do
      member do
        get  'publish_status/:publish', :action => 'publish_status', :as => 'publish_status'
        get  'previsu', :action => 'previsu', :as => 'previsu'
      end
    end
    post 'news/update/all', to: 'news#update_all', :as => 'news_update_all'

  end

  scope :module => 'front', :as => 'front' do
    root :to => 'indexs#index'

    resources :contact_forms, :only => [:create]

  end

 end
