class Admin::StoresController < Admin::ApplicationController
  before_action :set_admin_store, only: [:show, :edit, :update, :destroy]

  # GET /admin/stores
  # GET /admin/stores.json
  def index
    @stores = Store.where(user: current_user)
  end

  # GET /admin/stores/1
  # GET /admin/stores/1.json
  def show
  end

  # GET /admin/stores/new
  def new
    @store = Store.new
  end

  # GET /admin/stores/1/edit
  def edit
  end

  # POST /admin/stores
  # POST /admin/stores.json
  def create
    @store = Store.new(admin_store_params.merge(user: current_user))
    if @store.save
      redirect_to admin_stores_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /admin/stores/1
  # PATCH/PUT /admin/stores/1.json
  def update
    if @store.update(admin_store_params)
      redirect_to admin_stores_path, notice: 'Store was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /admin/stores/1
  # DELETE /admin/stores/1.json
  def destroy
    @store.destroy
    redirect_to admin_stores_path, notice: 'Store was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_store_params
      params.require(:store).permit(:name, :address)
    end
end
