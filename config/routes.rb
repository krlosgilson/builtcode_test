Rails.application.routes.draw do
  root :to => "dashboards#index"
  match '/dashboard' => 'dashboards#index', via: [:get]

  resources :appointments
  match '/get_appointment_allowed_times_availables' =>
        'appointments#get_allowed_times_availables', via: [:get]

  resources :patients
  resources :doctors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
