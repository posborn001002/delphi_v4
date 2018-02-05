Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'organizations#index'

  # Delphi
  get 'customer_jobs/:id/history',
    to: 'customer_jobs#history',
    as: 'history_of'


  resources :people do
    get 'newcontact', on: :new
  end

  resources :organizations do
    resources :people
  end

  resources :organizations do
    resources :customer_jobs
  end

  # Main Object Navigation
  resources :organizations
  resources :people
  resources :customer_jobs
  resources :supplier_orders
  resources :updates
  resources :date_lookups
  resources :pain_point_updates
  resources :measurements
  resources :metrics
  resources :toe_tags
  resources :workshops
  resources :pain_points
  resources :action_results


  # Miscellaneous
  get 'miscellaneous/login',
      to: 'miscellaneous#login',
      as: :miscellaneous_login
  get 'miscellaneous/register',
      to: 'miscellaneous#register',
      as: :miscellaneous_register
  get 'miscellaneous/forgot_password',
      to: 'miscellaneous#forgot_password',
      as: :miscellaneous_forgot_password
  get 'miscellaneous/locked_screen',
      to: 'miscellaneous#locked_screen',
      as: :miscellaneous_locked_screen

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
