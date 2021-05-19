Rails.application.routes.draw do
  root :to => "dashboards#index"

  match '/dashboard' => 'dashboards#index', via: [:get]
  match '/get_appointments_realized_by_doctor' => 
        'dashboards#get_appointments_realized_by_doctor', via: [:get]
  match '/get_patients_attended_count_by_doctor' => 
        'dashboards#get_patients_attended_count_by_doctor', via: [:get]

  resources :appointments
  match '/get_appointment_allowed_times_availables' =>
        'appointments#get_allowed_times_availables', via: [:get]

  resources :patients
  resources :doctors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
