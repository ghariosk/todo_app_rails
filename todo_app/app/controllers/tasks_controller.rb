class TasksController < ApplicationController
  def index
    @tasks=current_user.tasks
    @user=current_user
  end

  def show



    @task=current_user.tasks.find(params[:id])
    @user=current_user

  end

  def new

     @user=current_user

    @task=Task.new

   

   end

  def create

    @user=current_user

    new_task=@user.tasks.create(task_params)

    new_task.save

    redirect_to user_tasks_path
  end

  def edit
    @user=current_user
    @task=@user.tasks.find(params[:id])

  end

  def update

      @user=current_user

      new_post=@user.tasks.find(params[:id]).update(task_params)

  

      redirect_to user_tasks_path
  end

  def destroy
    @user=current_user

    @user.tasks.destroy(params[:id])

    redirect_to user_tasks_path
  end

  protected
  def task_params
    params.require(:task).permit(:name)
  end
end
