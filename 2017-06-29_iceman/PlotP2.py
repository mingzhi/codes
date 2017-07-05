""" Plot P2 """
from FitP2 import read_corr

def readfit(filename):
    """read fitting results"""
    with open(filename) as reader:
        header = reader.readline().rstrip().split(',')
        terms = reader.readline().rstrip().split(',')
        sample_d = float(terms[header.index('sample_d')])
        theta = float(terms[header.index('theta')])
        phi = float(terms[header.index('phi')])
        fbar = float(terms[header.index('fbar')])
    return (sample_d, theta, phi, fbar)

def main():
    """plot P2"""
