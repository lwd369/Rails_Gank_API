Rails.application.routes.draw do
  get   '/publishdates',     to: 'data_collector#getPublishDates'
  get   '/saveItem',         to: 'data_collector#saveGankItem'
end
