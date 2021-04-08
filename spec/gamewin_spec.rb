require '../lib/board'

describe Board do
    describe '#check_win' do
        it 'Check winning cases vertical x' do
            board = Board.new(['x','x','x','o','x','o','x','o','x'])
            expect(board.check_win).to eql('x')
        end
        it 'Check winning cases horizontal x' do
            board = Board.new(['x','o','o','x','o','o','x','o','x'])
            expect(board.check_win).to eql('x')
        end
        it 'Check winning cases diagonal x' do
            board = Board.new(['x','o','2','o','x','4','6','7','x'])
            expect(board.check_win).to eql('x')
        end
        it 'Check winning cases vertical o' do
            board = Board.new(['o','o','o','x','o','x','o','x','o'])
            expect(board.check_win).to eql('o')
        end
        it 'Check winning cases horizontal o' do
            board = Board.new(['o','x','x','o','x','x','o','x','o'])
            expect(board.check_win).to eql('o')
        end
        it 'Check winning cases diagonal o' do
            board = Board.new(['o','x','2','x','o','4','6','7','o'])
            expect(board.check_win).to eql('o')
        end
        it 'check draw cases' do
            board = Board.new(['x','o','x','x','o','o','o','x','x'])
            expect(board.check_win).to eql(false)
        end
    end

end