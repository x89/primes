# Sieve of Eratosthenes

## Findings of Ruby vs Crystal

Crystal seems to be about 2x the speed using `crystal eratosthenes.cr --release`
compared with `ruby eratosthenes.rb` and although the Ruby version was easier
to write it is not ridiculously so.

As of this date the Crystal version is probably sub-optimal, but the Ruby and
Crystal versions at least follow almost identical code.

Something of note is that the eratosthenes sieve goes OOM on my machine with 8G
of RAM while the Crystal one is fine with that.

## Findings versus C

It's unfair to compare with the C version that I have but it runs 100m in 0.474s
which is about 10x faster. Though this is unfair as the C version is wildly
different and doesn't use higher order constructs like structs and objects.
