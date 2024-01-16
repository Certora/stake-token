
echo "1:"
certoraRun  certora/conf/allProps.conf \
            --rule integrityOfStaking \
            --rule noStakingPostSlashingPeriod \
            --rule noSlashingMoreThanMax \
            --rule integrityOfSlashing \
            --rule integrityOfReturnFunds \
            --rule noRedeemOutOfUnstakeWindow \
            --rule totalSupplyDoesNotDropToZero \
            --rule cooldownCorrectness \
            --rule rewardsGetterEquivalentClaim \
            --rule rewardsMonotonicallyIncrease \
            --rule rewardsIncreaseForNonClaimFunctions \
            --rule indexesMonotonicallyIncrease \
            --rule slashingDontDecreaseExchangeRate \
            --rule returnFundsDontIncreaseExchangeRate \
            --rule exchangeRateNeverZero \
            --rule integrityOfRedeem \
            --rule previewStakeEquivalentStake \
            --rule redeem_in_post_slashing_period \
            --rule exchangeRate_cant_changed_unless_slash_returnFunds \
            --rule cooldown_always_updates_cooldown_info \
            --rule when_changing_bal_update_rewards_must_be_called \
            --rule transfer_from_user_to_itself_changes_no_balance \
            --rule slash_increases_exchangeRate \
            --rule returnFunds_decreases_exchangeRate \
            --rule redeem_not_reverting \
            --msg "1. allProps.conf::  all rules"


echo "2:"
certoraRun  certora/conf/allProps.conf \
            --rule_sanity none \
            --rule slashing_cant_occur_during_post_slashing_period \
            --msg "2. slashing_cant_occur_during_post_slashing_period"

echo "3:"
certoraRun  certora/conf/propertiesWithSummarization.conf --rule_sanity basic  \
            --msg "3. propertiesWithSummarization.conf"

echo "4:"
certoraRun  certora/conf/invariants.conf --rule_sanity basic  \
            --msg "4. invariants.conf"

echo "5:"
certoraRun  certora/conf/frontRun.conf   \
            --rule front_run__redeem \
            --msg "5. frontRun.conf:: front_run__redeem"

echo "6:"
certoraRun  certora/conf/frontRun.conf   \
            --rule front_run__balance \
            --msg "6. frontRun.conf:: front_run__balance"

echo "7:"
certoraRun  certora/conf/frontRun.conf   \
            --rule front_run__cooldown_info \
            --msg "7. frontRun.conf:: front_run__cooldown_info"


