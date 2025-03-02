import pandas as pd

def meltTable(report: pd.DataFrame) -> pd.DataFrame:
    result = pd.melt(
        report,
        id_vars = ['product'],
        value_vars = ['quarter_1','quarter_2','quarter_3','quarter_4'],
        var_name = 'quarter',
        value_name = 'sales'
    )

    
    # Create a CategoricalDtype to ensure products stay in their original order
    product_order = pd.CategoricalDtype(categories=report['product'].tolist(), ordered=True)
    result['product'] = result['product'].astype(product_order)

    # Create a CategoricalDtype for quarters to ensure proper ordering
    quarter_order = pd.CategoricalDtype(
        categories=['quarter_1', 'quarter_2', 'quarter_3', 'quarter_4'], 
        ordered=True
    )
    result['quarter'] = result['quarter'].astype(quarter_order)

    # Sort first by quarter, then by the original product order
    result = result.sort_values(['quarter', 'product']).reset_index(drop=True)

    return result