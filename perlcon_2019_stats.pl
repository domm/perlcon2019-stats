#!/usr/bin/env perl
use strict;
use warnings;
use 5.028;
use utf8;

my %labels = (
    5 => 'Perl 5',
    6 => 'Perl 6',
    g => 'General',
    o => 'Other Tech',
);
my $total = 0;
my %stats = map { $_ => 0 } keys %labels;

for my $line (<DATA>) {
    chomp($line);
    my @row = split( /\t/, $line );

    my $cat = substr( $row[0], 0, 1 );

    my $raw_duration = $row[1];
    my ( $fh, $fm, $th, $tm ) =
        $raw_duration =~ /(\d\d):(\d\d)–(\d\d):(\d\d)/;
    my $dur = ( ( $th * 60 ) + $tm ) - ( ( $fh * 60 ) + $fm );

    $stats{$cat} += $dur;
    $total += $dur;
}

for my $cat ( sort keys %stats ) {
    printf(
        "%s:\t%.0f%% (%i min)\n",
        $labels{$cat},
        100 * $stats{$cat} / $total,
        $stats{$cat}
    );
}

__DATA__
g	16:00–16:45	Curtis Poe	<a href="https://perlcon.eu/talk/gc/113">Testing Lies</a>
5	11:40–12:00	Tadeusz Sośnierz	<a href="https://perlcon.eu/talk/gc/101">How Moose made me a bad OO programmer</a>
o	15:10–15:30	Lars Dɪᴇᴄᴋᴏᴡ 迪拉斯	<a href="https://perlcon.eu/talk/gc/95">parsing confidently</a>
6	16:00–16:45	Jens Rehsack	<a href="https://perlcon.eu/talk/gc/89">Perl 6 for beginners</a>
5	15:10–15:30	Kenichi Ishigaki	<a href="https://perlcon.eu/talk/gc/86">Recent PAUSE Changes</a>
5	12:05–12:25	Gonzalo Diethelm	<a href="https://perlcon.eu/talk/gc/84">Embedding JavaScript in Perl</a>
5	15:10–15:30	Takayuki Fukumoto	<a href="https://perlcon.eu/talk/gc/83">Perl in Japan</a>
g	11:40–12:25	Paul Johnson	<a href="https://perlcon.eu/talk/gc/81">How To Test</a>
6	14:20–15:05	Jonathan Worthington	<a href="https://perlcon.eu/talk/gc/80">Perl 6 performance update</a>
5	14:20–15:05	Jeffrey Goff	<a href="https://perlcon.eu/talk/gc/43">Custom Routing Protocols in Dancer - Play Nicely With JavaScript</a>
g	16:00–16:45	Julien Fiegehenn	<a href="https://perlcon.eu/talk/gc/35">Finding humans to turn into developers</a>
5	12:30–13:15	Eugen Konkov	<a href="https://perlcon.eu/talk/gc/34">Debugging with Perl</a>
5	14:20–15:05	Saif Ahmed	<a href="https://perlcon.eu/talk/gc/32">Quick and Dirty GUI Applications using GUIDeFATE (revisited)</a>
5	12:30–13:15	Mohammad Anwar	<a href="https://perlcon.eu/talk/gc/30">CPAN Contributors - Do's and Don'ts</a>
6	12:30–13:15	Juan Julián Merelo-Guervós	<a href="https://perlcon.eu/talk/gc/29">Apocrypha: stories about Perl 6 documentation</a>
o	11:40–12:25	Thomas Klausner	<a href="https://perlcon.eu/talk/gc/27">Deploying Perl Apps using Docker, Gitlab &amp; Kubernetes</a>
5	10:10–11:10	Sawyer X	Keynote: <a href="https://perlcon.eu/talk/gc/72">Perl 5: The past, the present, and one possible future</a>
g	14:20–15:05	Julien Fiegehenn	<a href="https://perlcon.eu/talk/gc/127">Turning humans into developers with Perl</a>
6	10:10–11:10	Elizabeth Mattijsen	Keynote: <a href="https://perlcon.eu/talk/gc/111">DeMythifying Perl 6</a>
5	14:20–15:05	Rolf Langsdorf	<a href="https://perlcon.eu/talk/gc/97">Fun with Macros</a>
6	15:10–15:30	Laurent Rosenfeld	<a href="https://perlcon.eu/talk/gc/96">Constraint Programming in Perl 6</a>
5	16:25–16:45	José Joaquín Atria	<a href="https://perlcon.eu/talk/gc/90">Exploring game programming patterns in Perl</a>
o	16:00–16:45	Jens Rehsack	<a href="https://perlcon.eu/talk/gc/88">Cross-compiling for Perl developers</a>
5	15:10–15:30	Takahiro Shimizu	<a href="https://perlcon.eu/talk/gc/82">How to build  traditional Perl interpreters.</a>
6	12:30–13:15	Carl Mäsak	<a href="https://perlcon.eu/talk/gc/75">The parsed and the curious: macros for Perl 6</a>
5	12:55–13:15	Diego Kuperman	<a href="https://perlcon.eu/talk/gc/67">Growing our workforce</a>
g5	15:10–15:30	Martin Becker	<a href="https://perlcon.eu/talk/gc/66">Supercharging Math Modules with Databases</a>
6	12:05–12:25	Alexander Kiryuhin	<a href="https://perlcon.eu/talk/gc/65">When Cro is not a Web Framework: implementing LDAP for Perl 6</a>
5	16:00–16:20	Wieger Opmeer	<a href="https://perlcon.eu/talk/gc/63">RPC-Switch: JSON-RPC service-composition</a>
6	16:00–16:45	Herbert Breunung	<a href="https://perlcon.eu/talk/gc/61">goto considered useful</a>
o6	11:40–12:00	Igor Chubin	<a href="https://perlcon.eu/talk/gc/58">Console oriented sites and Perl 6: joining the worlds together</a>
o	14:20–15:05	Max Maischein	<a href="https://perlcon.eu/talk/gc/56">What I learned about SQL in 2018</a>
g	12:30–12:50	Dave Cross	<a href="https://perlcon.eu/talk/gc/52">Monoliths, Balls of Mud and Silver Bullets</a>
g	12:30–13:15	Job _	<a href="https://perlcon.eu/talk/gc/41">Human Determination: A critique of CAPTCHAs</a>
5	11:40–12:25	Hauke Dämpfling	<a href="https://perlcon.eu/talk/gc/40">WebPerl - Run Perl in the Browser!</a>
5	11:40–12:25	Steffen Winkler	<a href="https://perlcon.eu/talk/gc/39">1st Locale-TextDomain-OO practical examples, 2nd Locale-TextDomain-OO autotranslation</a>
6	10:10–11:10	Jonathan Worthington	<a href="https://perlcon.eu/talk/gc/136">Keynote Day 3: Perl 6 Concurrency</a>
g	16:00–16:45	Job _	<a href="https://perlcon.eu/talk/gc/130">Sociology and psychology of disability simulations</a>
g	16:25–16:45	Mallory 	<a href="https://perlcon.eu/talk/gc/129">Designing and Coding for Low Vision</a>
5	15:10–15:30	Rolf Langsdorf	<a href="https://perlcon.eu/talk/gc/98">The Camel Paradox</a>
g	14:20–14:40	Ilya Sher	<a href="https://perlcon.eu/talk/gc/92">On Information Loss in Software</a>
5	14:45–15:05	Ervin Ruci	<a href="https://perlcon.eu/talk/gc/91">3dgeonames - A 3d open location code written in perl5</a>
5	14:20–15:05	Shoichi Kaji	<a href="https://perlcon.eu/talk/gc/85">cpm 1.0</a>
o	15:10–15:30	Robert Acock	<a href="https://perlcon.eu/talk/gc/79">Progressive Web Applications</a>
6	16:00–16:45	Arne Sommer	<a href="https://perlcon.eu/talk/gc/78">Easy as Six</a>
6	15:10–15:30	Juan Julián Merelo-Guervós	<a href="https://perlcon.eu/talk/gc/70">Genesis: Concurrent evolutionary algorithms in Perl 6</a>
g5	11:40–12:25	Viktor Turskyi	<a href="https://perlcon.eu/talk/gc/69">The working architecture of Perl applications</a>
6	12:05–12:25	Alexander Kiryuhin	<a href="https://perlcon.eu/talk/gc/64">ASN.1 for Perl 6: with elegance and metacompilation</a>
g	11:40–12:00	Thomas Klausner	<a href="https://perlcon.eu/talk/gc/57">Things I learned at 'Advent of Code'</a>
5	11:40–12:25	Mohammad Anwar	<a href="https://perlcon.eu/talk/gc/44">Protect your Perl script from common security issues</a>
5	14:20–15:05	Jeffrey Goff	<a href="https://perlcon.eu/talk/gc/42">Procrastinate with DBIx::LazyCache</a>
o	12:30–12:50	H.Merijn Brand	<a href="https://perlcon.eu/talk/gc/38">Using GeoIP to monitor break-in attempts</a>
5	16:00–16:20	E. Choroba	<a href="https://perlcon.eu/talk/gc/36">Threads, thread unsafe modules, and an alternative</a>
g	12:30–13:15	Dave Cross	<a href="https://perlcon.eu/talk/gc/28">Measuring the Quality of your Perl Code</a>
5	12:30–13:15	Nicolas Rochelemagne	<a href="https://perlcon.eu/talk/gc/25">Overloading Perl OPs using XS</a>
