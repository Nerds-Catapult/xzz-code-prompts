pub fn run () {

    //statically typed but usually infers based on usage and var

    //default:i32
    let index = 1;

    //f64
    let index2 = 0.66;

    //explicit
    let y:i64 = 5544546445;

    //maximum size
    println!("Maximum i32: {}, maximum i64: {:2}", i32::MAX, i64::MAX);

    let is_logged_in = true;

    let var1 = 15;
    let var2 = 2;
    //expression
    let is_less: bool = (var1 * var2) < 0;

    let is_greater: bool = ( var1/2 ) > 1;

    //char unicode
    let alphabet1 = 'a';

    let alphabet_multiple = '\u{1F600}';

    println!("{:?}", (index, index2, y, is_logged_in, is_less, is_greater, alphabet1, alphabet_multiple));

}