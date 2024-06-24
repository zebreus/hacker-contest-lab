for i in `seq 0 1 100`; do 
    cat << EOF >> proc_files.txt
/proc/$i/environ
/proc/$i/envron
/proc/$i/environment
/proc/$i/cmdline
/proc/$i/exe
/proc/$i/fd/0
/proc/$i/gid_map
/proc/$i/uid_map
/proc/$i/loginuid
/proc/$i/net/arp
/proc/$i/stat
/proc/$i/statm
/proc/$i/status
EOF
#     cat << EOF >> proc_files.txt
# /proc/$i/environ
# /proc/$i/envron
# /proc/$i/arch_status
# /proc/$i/attr/apparmor/current
# /proc/$i/attr/current
# /proc/$i/autogroup
# /proc/$i/cgroup
# /proc/$i/cmdline
# /proc/$i/comm
# /proc/$i/coredump_filter
# /proc/$i/cpu_resctrl_groups
# /proc/$i/cpuset
# /proc/$i/exe
# /proc/$i/fd/0
# /proc/$i/gid_map
# /proc/$i/limits
# /proc/$i/loginuid
# /proc/$i/maps
# /proc/$i/mountinfo
# /proc/$i/mounts
# /proc/$i/net/anycast6
# /proc/$i/net/arp
# /proc/$i/net/connector
# /proc/$i/net/dev
# /proc/$i/net/dev_mcast
# /proc/$i/net/dev_snmp6/lo
# /proc/$i/net/fib_trie
# /proc/$i/net/fib_triestat
# /proc/$i/net/icmp
# /proc/$i/net/icmp6
# /proc/$i/net/if_inet6
# /proc/$i/net/igmp
# /proc/$i/net/igmp6
# /proc/$i/net/ip6_flowlabel
# /proc/$i/net/ip6_mr_cache
# /proc/$i/net/ip6_mr_vif
# /proc/$i/net/ip_mr_cache
# /proc/$i/net/ip_mr_vif
# /proc/$i/net/ipv6_route
# /proc/$i/net/mcfilter
# /proc/$i/net/mcfilter6
# /proc/$i/net/netfilter/nf_log
# /proc/$i/net/netlink
# /proc/$i/net/netstat
# /proc/$i/net/packet
# /proc/$i/net/protocols
# /proc/$i/net/psched
# /proc/$i/net/ptype
# /proc/$i/net/raw
# /proc/$i/net/raw6
# /proc/$i/net/route
# /proc/$i/net/rt6_stats
# /proc/$i/net/rt_acct
# /proc/$i/net/rt_cache
# /proc/$i/net/snmp
# /proc/$i/net/snmp6
# /proc/$i/net/sockstat
# /proc/$i/net/sockstat6
# /proc/$i/net/softnet_stat
# /proc/$i/net/stat/arp_cache
# /proc/$i/net/stat/ndisc_cache
# /proc/$i/net/stat/rt_cache
# /proc/$i/net/tcp
# /proc/$i/net/tcp6
# /proc/$i/net/udp
# /proc/$i/net/udp6
# /proc/$i/net/udplite
# /proc/$i/net/udplite6
# /proc/$i/net/unix
# /proc/$i/net/wireless
# /proc/$i/numa_maps
# /proc/$i/oom_adj
# /proc/$i/oom_score
# /proc/$i/oom_score_adj
# /proc/$i/projid_map
# /proc/$i/sched
# /proc/$i/schedstat
# /proc/$i/sessionid
# /proc/$i/setgroups
# /proc/$i/smaps
# /proc/$i/smaps_rollup
# /proc/$i/stat
# /proc/$i/statm
# /proc/$i/status
# /proc/$i/timens_offsets
# /proc/$i/timers
# /proc/$i/uid_map
# /proc/$i/wchan

# EOF
done

for i in `seq 0 1 30000`; do 
    cat << EOF >> proc_files.txt
/proc/$i/environ
/proc/$i/cmdline
EOF
done