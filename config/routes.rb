Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "auth", to: "auth#create"
      get "profile", to: "profiles#show"
      patch "profile", to: "profiles#update"
      get "users", to: "users#index"
      post "users", to: "users#create"
      get "encounters", to: "encounters#index"
      get "encounter/:id", to: "encounters#show"
      patch "encounter/:id", to: "encounters#update"
      get "hpi/:id", to: "hpis#show"
      patch "hpi/:id", to: "hpis#update"
      get "rosystem/:id", to: "rosystems#show"
      patch "rosystem/:id", to: "rosystems#update"
      get "problem_exam/:id", to: "problem_exams#show"
      patch "problem_exam/:id", to: "problem_exams#update"
      get "intake/:id", to: "intakes#show"
      patch "intake/:id", to: "intakes#update"
      get "diagnosis/:id", to: "diagnoses#show"
      patch "diagnosis/:id", to: "diagnoses#update"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
