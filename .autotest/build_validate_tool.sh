#!/bin/bash
#ARG_POSITIONAL_SINGLE([repo],[The repository of build project])
#ARG_POSITIONAL_SINGLE([branch],[The branch name of build project])
#ARG_POSITIONAL_SINGLE([target_dir],[The target directory])
#ARG_OPTIONAL_SINGLE([build],[],[skip to build project],["on"])
#ARG_OPTIONAL_SINGLE([])
#ARG_HELP([])
#ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.7.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
	echo "$1" >&2
	exit ${_ret}
}


begins_with_short_option()
{
	local first_option all_short_options='h'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_build="on"


print_help()
{
	printf 'Usage: %s [--build <arg>] [-h|--help] <repo> <branch> <target_dir>\n' "$0"
	printf '\t%s\n' "<repo>: The repository of build project"
	printf '\t%s\n' "<branch>: The branch name of build project"
	printf '\t%s\n' "<target_dir>: The target directory"
	printf '\t%s\n' "--build: skip to build project (default: '"on"')"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			--build)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_build="$2"
				shift
				;;
			--build=*)
				_arg_build="${_key##--build=}"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'repo', 'branch' and 'target_dir'"
	test "${_positionals_count}" -ge 3 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 3 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 3 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 3 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_repo _arg_branch _arg_target_dir "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash
#
PRG="$0"
PRGDIR=`dirname "$PRG"`
[ -z "$BUILD_HOME" ] && BUILD_HOME=`cd "$PRGDIR" >/dev/null; pwd`

#declare variables
WORKSPACE=${BUILD_HOME}/../workspace

${BUILD_HOME}/build_project.sh --build ${_arg_build} ${_arg_repo} ${_arg_branch} ${_arg_target_dir}

if [ ! -f "${_arg_target_dir}/target/skywalking-autotest.jar" ]; then
    echo "[ERROR] the validate tools is not exist. Please make sure the execute command without --no-build."
    exit -1
fi

echo "[INFO] copy validate tool jar"
cp ${_arg_target_dir}/target/skywalking-autotest.jar ${WORKSPACE}

#
# ] <-- needed because of Argbash
