# -*- encoding : utf-8 -*-
namespace :dev do
  desc 'Rebuild system'
  task build: %w(tmp:clear log:clear db:drop db:create db:migrate db:seed)
end
