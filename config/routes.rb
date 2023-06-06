Rails.application.routes.draw do
  # todo_lists
  resources :todo_lists, only:[:index, :show, :destroy]

  # todo_contents
  resources :todo_contents, only:[:create, :destroy]
  get 'todo_contents' => 'todo_contents#new', as: 'new_todo_content'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, except: %i[show]
end
