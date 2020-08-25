class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: "#{Task.model_name.human}の作成に成功しました。"
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "#{Task.model_name.human}の更新に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "#{Task.model_name.human}の削除に成功しました。"
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:is_finish, :name)
    end
end
