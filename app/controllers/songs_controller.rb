class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json
  

  
  def index
    @songs = Song.all
    @notes = note_array()
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new
    @notes = note_array()
    @note_forms = note_form_array()
    @sections = section_array()
    if params["num_verse_chords"].present?
      @num_verse_chords = params["num_verse_chords"].to_i
    else
      @num_verse_chords = 0
    end
    
    if params["num_chorus_chords"].present?
      @num_chorus_chords = params["num_chorus_chords"].to_i
    else
      @num_chorus_chords = 0
    end
    
    if params["num_bridge_chords"].present?
      @num_bridge_chords = params["num_bridge_chords"].to_i
    else
      @num_bridge_chords = 0
    end
    
    if params["which_form"] == "verse"
      @num_verse_chords += 1
    end
    if params["which_form"] == "chorus" 
      @num_chorus_chords += 1
    end
    if params["which_form"] == "bridge" 
      @num_bridge_chords += 1
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
    @notes = note_array()
    @note_forms = note_form_array()
    @sections = section_array()
    @num_verse_chords = @song.song_structures.where("section" => "verse").count
    @num_chorus_chords = @song.song_structures.where("section" => "chorus").count
    @num_bridge_chords = @song.song_structures.where("section" => "bridge").count
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.create("name" => params["song_name"], "bpm" => params["song_bpm"])
    
    @key = SongStructure.create("song_id" => @song.id, "section" => "", "order" => nil, "note_id" =>
      Note.where("name" => params["key_name"], "form" => params["key_form"]).first.id)
      
    if params["verse1_name"].present?
      @verse1 = SongStructure.create("song_id" => @song.id, "section" => "verse", "order" => 1, "note_id" =>
        Note.where("name" => params["verse1_name"], "form" => params["verse1_form"]).first.id)
    end
    
    if params["verse2_name"].present?
      @verse1 = SongStructure.create("song_id" => @song.id, "section" => "verse", "order" => 2, "note_id" =>
        Note.where("name" => params["verse2_name"], "form" => params["verse2_form"]).first.id)
    end
    
    if params["verse3_name"].present?
      @verse1 = SongStructure.create("song_id" => @song.id, "section" => "verse", "order" => 3, "note_id" =>
        Note.where("name" => params["verse3_name"], "form" => params["verse3_form"]).first.id)
    end
    
    if params["verse4_name"].present?
      @verse1 = SongStructure.create("song_id" => @song.id, "section" => "verse", "order" => 4, "note_id" =>
        Note.where("name" => params["verse4_name"], "form" => params["verse4_form"]).first.id)
    end
    
    if params["chorus1_name"].present?
      @verse1 = SongStructure.create("song_id" => @song.id, "section" => "chorus", "order" => 1, "note_id" =>
        Note.where("name" => params["chorus1_name"], "form" => params["chorus1_form"]).first.id)
    end
    
    if params["chorus2_name"].present?
      @verse1 = SongStructure.create("song_id" => @song.id, "section" => "chorus", "order" => 2, "note_id" =>
        Note.where("name" => params["chorus2_name"], "form" => params["chorus2_form"]).first.id)
    end
    
    if params["chorus3_name"].present?
      @verse1 = SongStructure.create("song_id" => @song.id, "section" => "chorus", "order" => 3, "note_id" =>
        Note.where("name" => params["chorus3_name"], "form" => params["chorus3_form"]).first.id)
    end
    
    if params["chorus4_name"].present?
      @verse1 = SongStructure.create("song_id" => @song.id, "section" => "chorus", "order" => 4, "note_id" =>
        Note.where("name" => params["chorus4_name"], "form" => params["chorus4_form"]).first.id)
    end
    
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.song_structures.each do |song_structure|
      song_structure.destroy
    end
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end
  
  def filter
    @key_name = params["key_name"]
    @key_form = params["key_form"]
    @songs = []
    @notes = note_array()
    
    Song.all.each do |song|
      if(song.song_structures.where("order" => nil).first.note.name == @key_name && song.song_structures.where("order" => nil).first.note.form == @key_form)
        @songs << song
      end
    end
    
    respond_to do |format|
      format.html # filter.html.erb
      format.json { render json: @songs }
    end
    
  end
end
