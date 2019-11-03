class TasksController < ApplicationController
  before_action :set_task, only: [:show,:edit,:update,:destroy]
    PER = 10
  def index
      if params[:name].present? && params[:status].present?
        @tasks = Task.where(name_serch(params[:task][:name]).status_serch(params[:task][:status]))
      elsif params[:name].present?
        @tasks = Task.where(name_serch[:task][:name])
      elsif params[:status].present?
        @tasks = Task.where(status_serch[:task][:status])
      elsif params[:sort_deadline]
        @tasks = Task.all.order(deadline: "DESC")
      else
        @tasks = Task.all.order(created_at: "DESC")
      end
       @tasks = Task.page(params[:page]).per(PER)
    end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
