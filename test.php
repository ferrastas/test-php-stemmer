<?php

echo stemword('dakpannen', 'dutch', 'UTF_8') . "\n" ;
assert(stemword('dakpannen', 'dutch', 'UTF_8') === "dakpann");
echo stemword('balletje', 'dutch', 'UTF_8') . "\n" ;
assert(stemword('balletje', 'dutch', 'UTF_8') === "balletj");
