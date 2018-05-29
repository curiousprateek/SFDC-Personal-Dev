global class Option {
    
    public String value;
    public String selection;
    public String key;
    public String img;
    public String imgUrl;
    
    global Option(String value, String key){
        this.value = value;
        this.selection = value;
        this.key = key;
    }
}