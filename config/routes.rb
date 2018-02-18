Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, :controllers => { :users => "users" }

      #{ :sessions => "sessions" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'organizations#index'

  # Delphi

  resources :organizations do
    resources :users
    resources :people
  end


  ## Process Owners
  resources :process_owners do
    resources :people
    resources :users
    resources :customers
    resources :suppliers
    resources :customer_jobs
    resources :supplier_orders
    resources :workshops
  end


  resources :action_result_updates
  resources :customer_job_updates
  resources :customer_updates
  resources :metric_updates
  resources :pain_point_updates
  resources :process_owner_updates
  resources :supplier_updates
  resources :supplier_order_updates
  resources :toe_tag_updates
  resources :workshop_updates

  ## Customers
  resources :customers do
    resources :customer_jobs
    resources :contacts
    resources :users
  end
  resources :customer_jobs do
    resources :action_results
    resources :status_updates
    resources :customer_job_updates
  end
  ## Suppliers
  resources :suppliers do
    resources :supplier_orders
    resources :users
    resources :contacts
  end
  resources :supplier_orders do
    resources :action_results
    resources :status_updates
  end
  resources :people do
    resources :status_updates
    resources :pain_point_updates
    resources :metrics
  end
  resources :workshops do
    resources :workshop_updates
  end
  resources :workshops do
    resources :action_results
    resources :toe_tags
    resources :pain_points
  end
  resources :action_results do
    resources :toe_tags
    resources :pain_points
    resources :updates
    resources :measurements
  end
  resources :toe_tags do
    resources :status_updates
  end
  resources :pain_points do
    resources :pain_point_updates
  end
  resources :metrics do
    resources :measurements
  end

  # Main Object Navigation
  resources :status_updates
  resources :date_lookups
  resources :pain_point_updates
  resources :measurements
  resources :toe_tags
  resources :pain_points


  # AJAX
  get 'ajax/email_compose',
      to: 'ajax#email_compose',
      as: :ajax_email_compose
  get 'ajax/email_list',
      to: 'ajax#email_list',
      as: :ajax_email_list
  get 'ajax/email_opened',
      to: 'ajax#email_opened',
      as: :ajax_email_opened
  get 'ajax/email_reply',
      to: 'ajax#email_reply',
      as: :ajax_email_reply
  get 'ajax/demo_widget',
      to: 'ajax#demo_widget',
      as: :ajax_demo_widget
  get 'ajax/data_list.json',
      to: 'ajax#data_list',
      as: :ajax_data_list
  get 'ajax/notify_mail',
      to: 'ajax#notify_mail',
      as: :ajax_notify_mail
  get 'ajax/notify_notifications',
      to: 'ajax#notify_notifications',
      as: :ajax_notify_notifications
  get 'ajax/notify_tasks',
      to: 'ajax#notify_tasks',
      as: :ajax_notify_tasks

  # Misc methods
  get '/home/set_locale',
      to: 'home#set_locale',
      as: :home_set_locale

  # CK editor
  mount Ckeditor::Engine => '/ckeditor'
end
