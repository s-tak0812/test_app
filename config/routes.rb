Rails.application.routes.draw do
  # todo_lists
  resources :todo_lists, only:[:index, :show, :destroy, :new, :create]
  # get 'new_content' => 'todo_lists#new_content', as: 'new_content'
  # post 'add_content' => 'todo_lists#add_content', as: 'add_content'

  # todo_contents
  resources :todo_contents, only:[:create, :destroy]
  get 'todo_contents' => 'todo_contents#new', as: 'new_todo_content'
  # get 'new_content' => 'todo_contents#new_content', as: 'new_content'
  # post 'add_todo_content' => 'todo_contents#add_content', as: 'add_todo_content'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, except: %i[show]
end
