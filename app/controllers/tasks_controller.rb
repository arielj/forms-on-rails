class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  def bulk_update
    tasks = Task.where(id: params[:selected])
    case params[:operation]
    when "archive"
      tasks.update_all(archived: true)
    when "unarchive"
      tasks.update_all(archived: false)
    when "favorites"
      tasks.update_all(favorites: true)
    end

    redirect_to tasks_path
  end

  def bulk_delete
    tasks = Task.where(id: params[:selected])
    tasks.destroy_all

    redirect_to tasks_path
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created." }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    case params[:operation]
    when "archive"
      @task.update_column :archived, true
    when "unarchive"
      @task.update_column :archived, false
    else
      @task.attributes = task_params
    end

    if @task.save
      redirect_to tasks_url, notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :archived, :favorite, :priority)
    end
end
