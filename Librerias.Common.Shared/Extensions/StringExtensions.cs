﻿using System.Text.RegularExpressions;

namespace Librerias.Common
{
    public static class StringExtensions
    {
        public static bool IsNull(this string value)
        {
            return value == null;
        }

        public static bool IsNotNull(this string value)
        {
            return !IsNull(value);
        }

        public static bool IsNullOrEmpty(this string value)
        {
            return string.IsNullOrEmpty(value);
        }

        public static bool IsNotNullOrEmpty(this string value)
        {
            return !IsNullOrEmpty(value);
        }

        public static string FormatWith(this string value, params object[] args)
        {
            return string.Format(value, args);
        }

        public static bool IsValidEmail(this string value)
        {
            return Match(value, RegexUtils.EmailRegex);
        }

        private static bool Match(string value, Regex regex)
        {
            return value.IsNotNullOrEmpty() || regex.IsMatch(value);
        }

    }
}
