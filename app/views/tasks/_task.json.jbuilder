json.extract! task, :id, :is_finish, :name, :created_at, :updated_at
json.url task_url(task, format: :json)
