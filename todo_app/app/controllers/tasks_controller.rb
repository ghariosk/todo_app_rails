class TasksController < ApplicationController




  def index
     


   

    @tasks=current_user.tasks.sort_by &:id

    
    @user=current_user







  @tasks.each_with_index do |element,index|
      if index == true
            @task=@tasks.find(index)

      end

      if element.done == true 
      @hightlight="blue"
      end








  end


 



  
   $bounce = false




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
    @tasks=current_user.tasks

    @user=current_user

    new_task=@user.tasks.create(task_params)

    new_task.save

    @tasks.order(:id)

    $bounce = true





    redirect_to user_tasks_path
  end

  def edit
    @user=current_user
    @task=@user.tasks.find(params[:id])

  end

  def update

    @tasks=current_user.tasks

      @user=current_user

      new_post=@user.tasks.find(params[:id]).update(task_params)

      @tasks.order(:id)

  

      redirect_to user_tasks_path
  end

  def destroy
    @user=current_user

    @tasks=current_user.tasks

    

     @task=current_user.tasks.find(params[:id].to_i )

         @user.tasks.destroy(params[:id].to_i )

    


        redirect_to user_tasks_path
  end

  protected
  def task_params
    params.require(:task).permit(:name, :done, :id, :user_id)
  end
end
