class Admin::VendorsController < Admin::ApplicationController
  before_action :set_admin_vendor, only: [:show, :edit, :update, :destroy]

  # GET /admin/vendors
  # GET /admin/vendors.json
  def index
    @vendors = Vendor.all
  end

  # GET /admin/vendors/1
  # GET /admin/vendors/1.json
  def show
  end

  # GET /admin/vendors/new
  def new
    @vendor = Vendor.new(store_id: params[:store_id])
  end

  # GET /admin/vendors/1/edit
  def edit
  end

  # POST /admin/vendors
  # POST /admin/vendors.json
  def create
    @vendor = Vendor.new(admin_vendor_params)
    if @vendor.save
      redirect_to admin_vendors_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /admin/vendors/1
  # PATCH/PUT /admin/vendors/1.json
  def update
    if @vendor.update(admin_vendor_params)
      redirect_to admin_vendors_path, notice: 'vendor was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /admin/vendors/1
  # DELETE /admin/vendors/1.json
  def destroy
    @vendor.destroy
    redirect_to admin_vendors_path, notice: 'vendor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_vendor_params
      params.require(:vendor).permit(:name, :store_id)
    end
end
