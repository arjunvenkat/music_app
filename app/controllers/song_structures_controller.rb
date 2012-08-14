class SongStructuresController < ApplicationController
  # GET /song_structures
  # GET /song_structures.json
  def index
    @song_structures = SongStructure.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @song_structures }
    end
  end

  # GET /song_structures/1
  # GET /song_structures/1.json
  def show
    @song_structure = SongStructure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song_structure }
    end
  end

  # GET /song_structures/new
  # GET /song_structures/new.json
  def new
    @notes = note_array()
    @note_forms = note_form_array()
    @songs_info = songs_info()
    @sections = section_array()

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song_structure }
    end
  end

  # GET /song_structures/1/edit
  def edit
    @song_structure = SongStructure.find(params[:id])
    @notes = note_array()
    @note_forms = note_form_array()
    @songs_info = songs_info()
    @sections = section_array()
  end

  # POST /song_structures
  # POST /song_structures.json
  def create
    @song_structure = SongStructure.new#(params[:song_structure])
    @song_structure.song_id = params["song_id"]
    @song_structure.order = params["order"]
    @song_structure.section = params["section"] 
    @song_structure.note_id = Note.where("name" => params["note_name"], "form" => params["note_form"]).first.id
    #@song_structure.note_id = Note.where("name" => params["song_structure"]["song_id"]
    respond_to do |format|
      if @song_structure.save
        format.html { redirect_to @song_structure, notice: 'Song structure was successfully created.' }
        format.json { render json: @song_structure, status: :created, location: @song_structure }
      else
        format.html { render action: "new" }
        format.json { render json: @song_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /song_structures/1
  # PUT /song_structures/1.json
  def update
    @song_structure = SongStructure.find_by_id(params["song_id"])
    @song_structure.order = params["order"]
    @song_structure.section = params["section"]
    @song_structure.note_id = Note.where("name" => params["note_name"], "form" => params["note_form"]).first.id
    @song_structure.save

    respond_to do |format|
      if @song_structure.update_attributes(params[:song_structure])
        format.html { redirect_to @song_structure, notice: 'Song structure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_structures/1
  # DELETE /song_structures/1.json
  def destroy
    @song_structure = SongStructure.find(params[:id])
    @song_structure.destroy

    respond_to do |format|
      format.html { redirect_to song_structures_url }
      format.json { head :no_content }
    end
  end
end
