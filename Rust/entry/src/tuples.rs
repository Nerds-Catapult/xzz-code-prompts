pub fn run() {
    //Different types of values grouped together, max 12 elements

    let location: (&str, &str, f64) = ("Nairobi", "Kenya", 36.8219);

    println!("Nairobi: {}, {}, Latitude {} ° E", location.0, location.1, location.2);
}