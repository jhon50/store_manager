class Admin::DaysController < Admin::ApplicationController
  before_action :set_admin_days, only: [:show, :edit, :update, :destroy]
  before_action :set_goal

  # GET /admin/days
  def index
    @days = Day.where(goal: @goal)
  end

  # GET /admin/days/1
  def show
  end

  # GET /admin/days/new
  def new
    @days = @goal.retrieve_days
  end

  # GET /admin/days/1/edit
  def edit
  end

  # POST /admin/days
  def create
    GoalDaysCreatorService.new(admin_days_params, @goal).call
    redirect_to admin_stores_path
  end

  # PATCH/PUT /admin/days/1
  def update
    if @day.update(admin_day_params)
      redirect_to admin_days_path, notice: 'day was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /admin/days/1
  def destroy
    @day.destroy
    redirect_to admin_days_path, notice: 'day was successfully destroyed.'
  end

  private
    def set_admin_day
      @day = Day.find(params[:id])
    end

    def set_goal
      @goal = Goal.find(params[:goal_id])
    end

  def admin_days_params
      params.require(:days).permit!
    end
end
