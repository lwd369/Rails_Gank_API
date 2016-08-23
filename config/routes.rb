Rails.application.routes.draw do
  get   '/publishdates',     to: 'data_collector#getPublishDates'
  get   '/saveItem',         to: 'data_collector#saveGankItem'
  get   '/hello',            to: 'data_collector#hello'
  get   '/update',            to: 'data_collector#update_daily_data'
end
