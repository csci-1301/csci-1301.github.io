# Datatypes in C#

## Value Types

### Numeric

#### Signed Integer

| Type | Range  | Size |
| :: | :--: | :: |
| `sbyte`  | -128 to 127  | Signed 8-bit integer |
| `short`  | -32,768 to 32,767  | Signed 16-bit integer |
| `int`  | -2,147,483,648 to 2,147,483,647  | Signed 32-bit integer |
| `long`  | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807  | Signed 64-bit integer |

<!--
Larger integers can be represented with `BigInteger` (<https://msdn.microsoft.com/en-us/library/system.numerics.biginteger.aspx>).
-->

#### Unsigned Integer

|Type | Range  | Size |
| :: | :: | :: |
| `byte`  | 0 to 255  | Unsigned 8-bit integer |
| `ushort`  | 0 to 65,535  | Unsigned 16-bit integer |
| `uint`  | 0 to 4,294,967,295  | Unsigned 32-bit integer |
| `ulong`  | 0 to 18,446,744,073,709,551,615  | Unsigned 64-bit integer |

#### Floating-point Numbers

| Type | Approximate Range | Precision | 
| :: | :--: | :: |
| `float` | ±1.5e−45 to ±3.4e38 | 7 digits|
| `double` | ±5.0e−324 to ±1.7e308 | 15--16 digits|
| `decimal` | (-7.9 x 1028 to 7.9 x 1028)/(100 to 1028) | 28--29 significant digits |

### Logical

| Type | Possible Values  | Size |
| :: | :: | :: |
| `bool`  |  `true`, `false`  | 8-bit |

### Character

| Type | Range  | Size |
| :: | :: | :: |
| `char`  | U+0000  to U+ffff | Unicode 16-bit character |

## Literals

| Name | Corresponding datatype | Examples | 
| :: | :: |  :: | 
| Integer Literal |  `int` | `40`, `-39`, `291838`, `0`, … | 
| Float Literal | `float` | `3.5F`, `-43.5f`, `309430.70006F`, … |
| Double Literal | `double` | `28.98`, `239.0`, `-391.089`, `0.0`, … |
| Decimal Literal | `decimal` | `8.95m`, `3283.9M`, `-30m`, … |
| Boolean Literal | `bool` | `true`, `false` |
| Character Literal | `char` | ` 'Y' `, `'a'`, `'0'`, `'\n'`, `'\x0058'`, `'\u0058'`, … |

<!--
Hexadecimal and unicode
-->

## Compatibility

This table is to be read as

> $✓$ means that those values or variables from the datatypes in the row and column can be "operated together" (meaning, you can for instance multiply them),
> ✘ means that those values or variables from the datatypes in the row and column can*not* be "operated together" (meaning, you can*not* for instance multiply them).

| | **Integer Literal** | **Float Literal** | **Double Literal** | **Decimal Literal** | 
| : | :: |  :: |  :: |  :: | 
| **`int`**    | $✓$ | ✘ | ✘ | ✘ |
| **`float`**   | $✓$ | $✓$ | ✘ | ✘ |
| **`double`**  | $✓$ | $✓$ | $✓$ | ✘ |
| **`decimal`** | $✓$ | ✘ | ✘ | $✓$ |

## Result Type of Operations

<!--
| Type of One Operand | Type of the Other Operand | Type of Result |
| :: |  :: |  :: | 
| `int` | `int` | `int` |
| `double` | `double` | `double` |
| `decimal` | `decimal` | `decimal` |
| `int` | `double` | `double` |
| `int` | `decimal` | `decimal` |
| `double` | `decimal` | `decimal` |
-->

This table is to be read as

> Values or variables from the datatypes in the row and column can be "operated together" and will produce the datatype indicated in the cell, or cannot be "operated together" if the value in the cell is "illegal".s

|           | **`int`** | **`float`** | **`double`** | **`decimal`** |
| : |  :: |  :: | :: |  :: | 
| **`int`**     | `int` | `float` | `double` | `decimal` |
| **`float`**   | `float` | `float` | `double` | illegal |
| **`double`**  | `double` | `double` | `double` | illegal |
| **`decimal`** | `decimal` | illegal | illegal | `decimal` |


## References {-}

- <https://docs.microsoft.com/en-us/dotnet/csharp/tour-of-csharp/types-and-variables>
- <https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/integral-types-table>
- <https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/floating-point-types-table>
- <https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/value-types-table>
- <https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/implicit-numeric-conversions-table>
- <https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/explicit-numeric-conversions-table>
