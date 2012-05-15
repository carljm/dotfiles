#!/bin/bash

DOMAINS="
bearbutte.org
blueheronfarms.org
dirtcircle.com
dirtcircledesign.com
dirtcircledogs.com
eatclosertohome.com
eatclosertohome.org
gerigmeyer.com
goshenride.com
goshenride.org
indigenousissues.org
indigenousissuesforums.org
mccoln.org
meyerbros.biz
meyerbros.org
meyerfam.org
meyerloewen.net
movingonblog.com
oddbirdcollective.com
oddbirdcollective.net
oddbirdcollective.org
rachel-ash.com
ridethetrolley.net
ridethetrolley.org
shetlerfast.net
threepines.org
vicioustrap.com
yoderfam.org
"

for domain in $DOMAINS; do
    host -al $domain ns1.linode.com > $domain.zone
done
