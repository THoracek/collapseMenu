CollapseMenu::Application.routes.draw do
  root :to => 'static_pages#home'
  match "/test" => 'static_pages#test'
end