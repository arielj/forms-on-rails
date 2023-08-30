json.extract! task, :id, :title, :archived, :favorite, :priority, :created_at, :updated_at
json.url task_url(task, format: :json)
