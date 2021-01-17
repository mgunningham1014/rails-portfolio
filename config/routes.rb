Rails.application.routes.draw do
  root 'portfolio#home'
  get 'portfolio/home'
  get 'portfolio/about'
  get 'portfolio/resume'
  get 'portfolio/projects'
  get 'portfolio/contact'
  get 'portfolio/download_resume'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
