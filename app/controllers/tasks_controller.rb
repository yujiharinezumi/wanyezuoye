class TasksController < ApplicationController
  before_action :set_task, only: [:show,:edit,:update,:destory]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを登録しました！"
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path,notice:"タスクを編集しました"
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:name,:content)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
