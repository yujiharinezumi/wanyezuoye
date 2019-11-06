class TasksController < ApplicationController
  PER = 5
  before_action :set_task, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user
  def index
      if params[:task].present?
        @tasks = Task.name_search(params[:task][:name]).status_search(params[:task][:status]).priority_search(params[:task][:priority]).page(params[:page]).per(PER)
      elsif params[:sort_deadline]
        @tasks = Task.all.order(deadline: "ASC").page(params[:page]).per(PER)
      else
        @tasks = Task.all.order(created_at: "DESC").page(params[:page]).per(PER)
      end
    end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      flash[:notice] = 'タスクの登録しました'
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'タスクの更新しました'
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = 'タスクの削除しました'
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name,:content,:deadline,:status,:priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
