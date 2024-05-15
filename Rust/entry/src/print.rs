pub fn run() {
    //From Brad Traversy
    println!("first Number: {}\n", 1);

    //multiple placeholders
    println!("{} {} on line {}\n", "multiple", "placeholders", 2);

    //positional Args
    println!("this is the first {0}, 2nd {0} and last {0}", "index");

    //Named Arguments
    println!("{p_cat1} is okay, but {P_cat2} is better", p_cat1="Nihilism", P_cat2="Moral Relativism");

    //traits
    println!("Jungle {:2}!", "fever");
    println!("Jungle {:2}!", "fever");
    println!("Jungle {:2}!", "fever");
    println!("Jungle {:2}!", "fever");
    println!("Jungle {:2}!", "fever");


    println!("Hello {1:0$}!", 5, "x");


    println!("Binary: {:b} Hex: {:x} Octal: {:o}", 10, 10, 10);

    //Debug trait
    println!("{:?}", (12, true, "hello"));
}

