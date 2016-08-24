class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.all
    @producto = Producto.new
    #@producto.build_productosxpza #debido a que es una relacion has_one se debe hacer de esta forma: @producto.build_productosxpza
    #pero en el caso de ser un has_many se debe usar @producto.productosxpza.build

  end

  # GET /productos/1
  # GET /productos/1.json
  def show

  end

  # GET /productos/new
  def new
    @producto = Producto.new
    @producto.build_productosxpza #debido a que es una relacion has_one se debe hacer de esta forma: @producto.build_productosxpza
    #pero en el caso de ser un has_many se debe usar @producto.productosxpza.build
  end

  # GET /productos/1/edit
  def edit
    @producto.build_productosxpza #debido a que es una relacion has_one se debe hacer de esta forma: @producto.build_productosxpza

  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto was successfully created.' }
        format.json { render :show, status: :created, location: @producto }
        format.js #ajax
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
        format.js #ajax
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @producto }
        format.js #ajax
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
        format.js #ajax
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'Producto was successfully destroyed.' }
      format.json { head :no_content }
      format.js #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:Clave, :Producto, :CodBarras, :Granel, :IVA, :IEPS, :UniMed, :VBase, :Equivalente, :Sector, :Ban_Envase, :IdClasp, :IdEmpresa, :Status, :Producto_id, :cover, Productosxpza_attributes: [:id, :idp, :pzaxcja, :producto_id ])
    end
end
