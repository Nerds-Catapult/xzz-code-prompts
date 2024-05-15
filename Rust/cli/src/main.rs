use std::io;

fn main() {
    println!("What is Your Weight in (Kgs): ");

    let mut input = String::new();

    io::stdin().read_line(&mut input).unwrap();

    let weight:f32 = input.trim().parse().unwrap();

    let mut mars_weight = calculate_weight_on_mars(weight);
    
    mars_weight = mars_weight * 1000.0;
    
    println!("Your Weight on Planet Mars would be: {} grams", mars_weight);
}


fn calculate_weight_on_mars(weight: f32) -> f32 {
    (weight / 9.81) *3.71112
}
