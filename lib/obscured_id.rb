module ObscuredId
  # skip look-alikes.
  # skip V so that I can use it in the future.
  OBSCURE_DIGITS = %w[
    2
    3
    4
    5
    6
    7
    8
    9
    A
    B
    C
    D
    E
    F
    G
    H
    J
    K
    L
    M
    N
    P
    Q
    R
    S
    T
    U
    W
    X
    Y
    Z
  ].freeze

  def obscure_id(id)
    # ht https://stackoverflow.com/a/38240325
    x = id * 387420489 % 4000000000
    digits = []
    while x > 0
      digits << OBSCURE_DIGITS[x % OBSCURE_DIGITS.size]
      x /= OBSCURE_DIGITS.size
    end
    digits.reverse.join
  end

  def deobscure_id(s)
    x = s.chars.inject(0) { |tot, c| tot * OBSCURE_DIGITS.size + OBSCURE_DIGITS.index(c) }
    x * 3513180409 % 4000000000
  end
end
