// darkmodern.nvim — colorscheme showcase
// AI-generated code for colorscheme highlighting demonstration only.
// No functional guarantees. Not intended for production use.

use std::fmt;
use std::collections::HashMap;

const GREETING:  &str = "Hello, World!";
const MAX_COUNT: usize = 5;

/// A weighted item.
#[derive(Debug, Clone)]
struct Item {
    id:     u32,
    weight: f64,
    label:  String,
}

impl Item {
    fn new(id: u32, weight: f64, label: &str) -> Self {
        Self { id, weight, label: label.to_owned() }
    }
}

impl fmt::Display for Item {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "[{}] {:<8} ({:.2})", self.id, self.label, self.weight)
    }
}

/// Compute the sum of an integer slice.
fn checksum(values: &[i32]) -> i32 {
    values.iter().sum()
}

fn main() {
    let items: Vec<Item> = vec![
        Item::new(1, 1.5,  "alpha"),
        Item::new(2, 2.0,  "beta"),
        Item::new(3, 0.75, "gamma"),
    ];

    let values: [i32; MAX_COUNT] = [10, 20, 30, 40, 50];
    let total = checksum(&values);

    if total > 100 {
        println!("{}", GREETING);
    } else {
        println!("sum = {}", total);
    }

    let mut labels: HashMap<&str, f64> = HashMap::new();
    labels.insert("alpha", 1.5);
    labels.insert("beta",  2.0);
    labels.insert("gamma", 0.75);

    for (key, val) in &labels {
        println!("  {:<8} => {:.2}", key, val);
    }

    items.iter()
         .filter(|item| item.weight > 1.0)
         .map(|item| item.to_string())
         .for_each(|line| println!("{}", line));
}
