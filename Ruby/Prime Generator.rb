def isPrime (aNumber)
    if (!aNumber.is_a? Integer) || aNumber < 2
        raise ArgumentError
    end
    i = 2
    itIsPrime = true
    while i <= Math.sqrt(aNumber)
        if aNumber % i == 0
            itIsPrime = false
            break
        end
        i += 1
    end
    return itIsPrime
end

def prime_generate
    i = 2
    while true
        if isPrime i
            yield i
        end
        i += 1
    end
end

prime_generate do |prime|
    if prime > 100000
        break
    end
    puts prime
end