class ParentsController < ApplicationController

	def show
    @parent = current_user.parent
    if @parent.id == params[:id].to_i
      @enfants = current_user.enfants
    else
      redirect_to root_path
    end
	end

  def new
    # renvoie le formulaire parent
    @parent = current_user.build_parent
  end

  def create
    @parent = current_user.build_parent(parent_params)
    if @parent.save
      redirect_to parent_path(@parent.id)
    else
      render action: 'new'
    end
  end

  def edit
    @parent = Parent.find(params[:id])
    redirect_to parent_path(current_user)if @parent != current_user.parent 

    
  end

  def update
    @parent = Parent.find(params[:id])
    redirect_to parent_path(current_user)if @parent != current_user.parent 
    if @parent.update(parent_params)
      redirect_to parent_path(current_user.parent.id)
    else
      render action: 'edit'
    end
  end
  
  private

  def parent_params
    # white lister les params autorisés
    params.require(:parent).permit( :civilite,
                                    :nom, 
                                    :prenom, 
                                    :adresse,
                                    :teldom, 
                                    :telpro1,
                                    :telpro2, 
                                    :urgnom, 
                                    :urgprenom, 
                                    :urgadresse, 
                                    :urgteldom, 
                                    :urgtelpro,
                                    :telport1,
                                    :telport2,
                                    :urgtelport,
                                    :civilite2,
                                    :street_number, 
                                    :route, 
                                    :locality, 
                                    :administrative_area_level_1, 
                                    :postal_code, 
                                    :country,)
  
  end

end
