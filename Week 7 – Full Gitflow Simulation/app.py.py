def calculate_total(price, quantity):
    if price < 0 or quantity < 0:
        raise ValueError("Price and quantity cannot be negative.")

    return price * quantity


def apply_discount(total, discount):
    if discount < 0 or discount > 100:
        raise ValueError("Discount must be between 0 and 100.")

    return total - (total * discount / 100)


if __name__ == "__main__":
    total = calculate_total(100, 2)
    final_amount = apply_discount(total, 10)

    print("Total:", total)
    print("Final Amount:", final_amount)