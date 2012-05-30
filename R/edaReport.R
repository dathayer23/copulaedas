# copulaedas: Estimation of Distribution Algorithms Based on Copulas
# Copyright (C) 2010-2012 Yasser Gonz�lez-Fern�ndez <ygf@icimaf.cu>
# Copyright (C) 2010-2012 Marta Soto <mrosa@icimaf.cu>
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.

edaReportDisabled <- function (eda, gen, fEvals, model, pop, popEval) {
}

setMethod("edaReport", "EDA", edaReportDisabled)


edaReportSimple <- function (eda, gen, fEvals, model, pop, popEval) {
    width <- max(getOption("digits") + 5, 10)
    if (gen == 1) {
        cat("\n")
        h <- c("Generation", "Minimum", "Mean", "Std. Dev.")
        cat(format(h, justify = "right", width = width), "\n")
    }
    stats <- c(min(popEval), mean(popEval), sd(popEval))
    cat(format(gen, width = width),
        format(stats, scientific = TRUE, width = width),
        "\n")
}


edaReportCombined <- function (...) {
    function (eda, gen, fEvals, model, pop, popEval) {
        methods <- list(...)
        args <- list(eda, gen, fEvals, model, pop, popEval)
        sapply(methods, function (m) do.call(m, args))
    }
}