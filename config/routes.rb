Rails.application.routes.draw do
  # todo_lists
  resources :todo_lists, only:[:index, :show, :destroy, :new, :create]

  # todo_contents
  resources :todo_contents, only:[:create, :destroy]
  get 'todo_contents' => 'todo_contents#new', as: 'new_todo_content'
  get 'todo_lists/:id/new_content' => 'todo_contents#new_content', as: 'new_content'
  post 'todo_lists/:id' => 'todo_contents#content_create', as: 'content_create'

  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, except: %i[show]
end
